function onInstall(event) {
  console.log('[ServiceWorker]', "Installing!", event);
}

function onActivate(event) {
  console.log('[ServiceWorker]', "Activating!", event);
}

function onFetch(event) {
  console.log('[ServiceWorker]', "Fetching!", event);
}
self.addEventListener('install', onInstall);
self.addEventListener('activate', onActivate);
self.addEventListener('fetch', onFetch);
