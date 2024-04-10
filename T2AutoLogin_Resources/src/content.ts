import { sendMessage } from './runtime/Message'
import { runAtDocumentEnd } from './utility/run_at_document_end'

const main = async () => {
  switch (location.hostname.toLowerCase()) {
    // redirect
    case 'portal.titech.ac.jp':
      switch (location.pathname.toLowerCase()) {
        case '/':
        case '/portal.pl':
          location.href = 'https://portal.nap.gsic.titech.ac.jp/'
          break
        case '/portal-e.pl':
          location.href = 'https://portal.nap.gsic.titech.ac.jp/portal-e.pl'
          break
      }
      return

    // authenticate
    case 'portal.nap.gsic.titech.ac.jp':
      browser.runtime.sendMessage({
        function: 'EXECUTE_SCRIPT',
        file: browser.runtime.getURL('js/authenticate.js'),
      })
      return

    // login vpn
    case 'rp.nap.gsic.titech.ac.jp':
      switch (location.pathname.toLowerCase()) {
        case '/vpnaccess_apm/service':
        case '/vpnaccess_apm/service/':
          runAtDocumentEnd(async () => {
            const password = (await sendMessage({ function: 'GET_PASSWORD' }))
              .data as string
            document.querySelector('input[name="password"]' as 'input')!.value =
              password
            document.querySelector('input[type="submit"]' as 'input')!.click()
          })
      }
      return
  }
}

main()
