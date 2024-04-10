import { Message } from './Message'

type DataMapping = {
  GET_ACCOUNT: {
    id: string
    password: string
    rows: string[]
  }
  GET_PASSWORD: string
  EXECUTE_SCRIPT: undefined
}

export type Response<M extends Message> =
  | {
      data: DataMapping[M['function']]
      error: null
    }
  | {
      data: null
      error: Error
    }
