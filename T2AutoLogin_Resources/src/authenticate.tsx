import React from 'react'
import { Authentication } from './component/Authentication'
import { createRoot } from 'react-dom/client'
import { i18next } from './localization/config'
import { runAtDocumentEnd } from './utility/run_at_document_end'

const renderAuthentication = () => {
  const appWrapper = document.createElement('div')
  document.body.insertBefore(appWrapper, document.body.firstChild)
  createRoot(appWrapper).render(<Authentication />)
}

runAtDocumentEnd(() => {
  switch (document.title) {
    case '東工大ポータル':
      renderAuthentication()
      i18next.changeLanguage('ja')
      break
    case 'Tokyo Tech Portal':
      renderAuthentication()
      i18next.changeLanguage('en')
      break
  }
})
