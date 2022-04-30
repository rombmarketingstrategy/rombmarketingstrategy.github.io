'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "74ffe3efbd3acdb72918b9c2fc18cca3",
"index.html": "7a25cf7533045d9c84bfdc5a023fd645",
"/": "7a25cf7533045d9c84bfdc5a023fd645",
"main.dart.js": "64f1ea60cd78af8811a40dcf31900626",
"icons/favicon-16x16.png": "9d9f04490764595acbfe7ab761b7f452",
"icons/favicon.ico": "32e603374e202b25198581094a419467",
"icons/apple-icon.png": "b4af5e9011068f6caf108fef4e1797e8",
"icons/apple-icon-144x144.png": "5c7f26a284c64f4dfdd926366abc4532",
"icons/android-icon-192x192.png": "67871800b3703666cc987e96ddb498fa",
"icons/apple-icon-precomposed.png": "b4af5e9011068f6caf108fef4e1797e8",
"icons/apple-icon-114x114.png": "37009d1b48807b6b9204969d55e382a7",
"icons/ms-icon-310x310.png": "c5953bf328a43fb1ef22459992b2d8ea",
"icons/ms-icon-144x144.png": "5c7f26a284c64f4dfdd926366abc4532",
"icons/apple-icon-57x57.png": "bd243f67ef32e74249ff5d6d5a41d044",
"icons/apple-icon-152x152.png": "b30321edd04eaa4a9fab491bf43efc68",
"icons/ms-icon-150x150.png": "f5df8c89d2d38e5e8cb294cf6ef2dec7",
"icons/android-icon-72x72.png": "45f0e4d776b82109d15a83beeed0e917",
"icons/android-icon-96x96.png": "487c829806f68dd6638b1b7a4e8b5ec0",
"icons/android-icon-36x36.png": "df44fe554769dd4b479c42d048d2e1a7",
"icons/apple-icon-180x180.png": "02d190b22388fb00c6e7c0ffaf6f7b56",
"icons/favicon-96x96.png": "4fe1076190ac206b9ddadd9f6cffd03c",
"icons/manifest.json": "b58fcfa7628c9205cb11a1b2c3e8f99a",
"icons/android-icon-48x48.png": "a42944d2f724b1804d3397aca2bbb6f8",
"icons/apple-icon-76x76.png": "2e30d07dc9a9d6fe38af50647a73fffc",
"icons/apple-icon-60x60.png": "ba5ff15b8a8e0ac6db776b8e2ca42b65",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/android-icon-144x144.png": "ebe9fb3e7a4d7f1cc7be55c220384d9e",
"icons/apple-icon-72x72.png": "45f0e4d776b82109d15a83beeed0e917",
"icons/apple-icon-120x120.png": "aa38e46ad9de8d16e435e2bc127aa740",
"icons/favicon-32x32.png": "3c8a826b1444a55e89f64f4391240dd2",
"icons/ms-icon-70x70.png": "f912205625e1e3f4bd048709b875264d",
"manifest.json": "e99f17b1b461188cbdba8a086f67f4b9",
"assets/AssetManifest.json": "f1fba26b2bda544dd893cd8c1e9bce04",
"assets/NOTICES": "d9c5907ff8cbc5e7e899a672bb122f44",
"assets/FontManifest.json": "82435241abf33be314ab3daa961ea034",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/easy_localization/i18n/ar-DZ.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/en.json": "5bd908341879a431441c8208ae30e4fd",
"assets/packages/easy_localization/i18n/en-US.json": "5bd908341879a431441c8208ae30e4fd",
"assets/packages/easy_localization/i18n/ar.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/assets/images/favicon.png": "26c238bb993bcfca9daf555dc13344e4",
"assets/assets/images/logo.svg": "4255f76223a79217d08e3b00d5df4c8f",
"assets/assets/fonts/Montserrat-Bold.otf": "9c71d42b6a840ecfda8fc555040a1c76",
"assets/assets/fonts/Montserrat-Regular.otf": "92db9a0772b3732e6d686fec3711af42",
"assets/assets/fonts/Montserrat-SemiBold.otf": "bb3740d350b0186ce32b5678972bf061",
"assets/assets/translations/hr.json": "68609f0557fd4f625216ab7d0bf8d1c0",
"assets/assets/animations/success.json": "12fa6be121b03164ac9bb1f9055e730d",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
