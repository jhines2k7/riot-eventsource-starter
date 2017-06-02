import './views/home.view'

import Storage from './storage'
import {Router} from 'director/build/director'
import riot from 'riot'
import reduce from './reducer'
import EventStore from './eventStore'
import config from './config'

let home = function() {
    "use strict";

    document.body.appendChild(document.createElement('home'));
    riot.mount('home');
};

let router = Router({
    '/': home
});

Storage.get().then( (events) => {
    EventStore.events = events;

    router.init();
});
