import { sendMessage } from './runtime/Message'

const main = async () => {
  const password = (await sendMessage({ function: 'GET_PASSWORD' }))
    .data as string
  document.querySelector('input[name="password"]' as 'input')!.value = password
  document.querySelector('input[type="submit"]' as 'input')!.click()
}

main()
