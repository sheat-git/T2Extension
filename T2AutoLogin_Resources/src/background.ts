import { Response } from './runtime/Response'
import { Message } from './runtime/Message'

browser.runtime.onMessage.addListener(
  <M extends Message>(
    message: M,
    sender: any,
    sendResponse: (response: Response<M>) => any,
  ) => {
    const resolve = (arg: Promise<any> | (() => Promise<any>)) => {
      const promise = typeof arg === 'function' ? arg() : arg
      promise.then(
        (response) =>
          sendResponse({
            data: response,
            error: null,
          }),
        (error) =>
          sendResponse({
            data: null,
            error: error,
          }),
      )
    }
    const resolveNativeMessage = (func: string) =>
      resolve(
        browser.runtime.sendNativeMessage('application.id', {
          function: func,
        }),
      )

    switch (message.function) {
      case 'GET_ACCOUNT':
      case 'GET_PASSWORD':
        resolveNativeMessage(message.function)
        return true
      case 'EXECUTE_SCRIPT':
        resolve(async () => {
          const tab = await browser.tabs.getCurrent()
          const tabId = tab?.id
          if (!tabId) throw new Error('Tab not found')
          await browser.scripting.executeScript({
            target: { tabId },
            world: 'ISOLATED',
            files: [message.file],
          })
        })
        return true
    }
  },
)
