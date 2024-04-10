export const runAtDocumentEnd = (fn: () => void) =>
  document.readyState === 'loading'
    ? document.addEventListener('DOMContentLoaded', fn)
    : fn()
