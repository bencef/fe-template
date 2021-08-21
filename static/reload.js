'use strict';
// This is our simple, robust watcher. It hooks into the Rescript build
// system to listen for build events.

// Btw, if you change this file and reload the page, your browser cache
// _might_ not pick up the new version. If you're in Chrome, do Force Reload.

let websocketReloader = null;
let cancelToken = null;
let LAST_SUCCESS_BUILD_STAMP = localStorage.getItem('LAST_SUCCESS_BUILD_STAMP') || 0;

const webSocketPort = 5000;

function setUpWebSocket() {
  if (websocketReloader === null || websocketReloader.readyState !== 1) {
    try {
      websocketReloader = new WebSocket(`ws://localhost:${webSocketPort}`);
      websocketReloader.onmessage = (message) => {
        const newData = JSON.parse(message.data).LAST_SUCCESS_BUILD_STAMP;
        if (newData > LAST_SUCCESS_BUILD_STAMP) {
          LAST_SUCCESS_BUILD_STAMP = newData;
          localStorage.setItem('LAST_SUCCESS_BUILD_STAMP', LAST_SUCCESS_BUILD_STAMP);
          // Refresh the page! This will naturally re-run everything,
          // including our moduleserve which will re-resolve all the modules.
          // No stable build!
          location.reload(true);
        }

      }
      if (cancelToken !== null) {
        clearInterval(cancelToken);
      }
    } catch (exn) {
      console.error("The watcher tried to connect to web socket, but failed. Here's the message:");
      console.error(exn);
    }
  }
};

setUpWebSocket();
cancelToken = setInterval(setUpWebSocket, 2000);
