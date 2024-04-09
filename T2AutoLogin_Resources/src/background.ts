import { Response } from './runtime/Response'
import { Message } from './runtime/Message'

browser.runtime.onMessage.addListener(
  (message: Message, sender, sendResponse: (response: Response) => any) => {
    switch (message.function) {
      case 'GET_ACCOUNT':
        browser.runtime
          .sendNativeMessage('application.id', {
            function: 'GET_ACCOUNT',
          })
          .then(
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
        return true
    }
  },
)
