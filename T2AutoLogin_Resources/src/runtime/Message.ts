import { Response } from './Response'

export type Message =
  | {
      function: 'GET_ACCOUNT' | 'GET_PASSWORD'
    }
  | {
      function: 'EXECUTE_SCRIPT'
      file: string
    }

export const sendMessage = async <M extends Message>(
  message: M,
): Promise<Response<M>> => browser.runtime.sendMessage(message)
