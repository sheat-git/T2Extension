import { Response } from './runtime/Response'
import { Message } from './runtime/Message'

browser.runtime.onMessage.addListener(
  (message: Message, sender, sendResponse: (response: Response) => any) => {
    const resolve = (promise: Promise<any>) =>
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
    const resolveSimpleFunction = (func: string) =>
      resolve(
        browser.runtime.sendNativeMessage('application.id', {
          function: func,
        }),
      )

    switch (message.function) {
      case 'GET_ACCOUNT':
      case 'GET_PASSWORD':
        resolveSimpleFunction(message.function)
        return true
    }
  },
)
