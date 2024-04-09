import { Response } from './Response'

export interface Message {
  function: RuntimeFunction
  argument?: any
}

export type RuntimeFunction = 'GET_ACCOUNT'

export const sendMessage = async (message: Message): Promise<Response> => {
  return await browser.runtime.sendMessage(message)
}
