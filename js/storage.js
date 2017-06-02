import localforage from 'localforage/dist/localforage'

export default class Storage {
    static set(events) {
        console.log('Added to storage', events);

        localforage.setItem('rocket-scores', events).catch(function(err) {
            // This code runs if there were any errors
            console.log(err);
        });
    }

    static get() {
        return localforage.getItem('rocket-scores').then( (events) => {
            // This code runs once the value has been loaded
            // from the offline store.
            if(events === null) {
                events = [];
            }

            console.log('Returned from storage', events);
            return events;
        }).catch(function(err) {
            // This code runs if there were any errors
            console.log(err);
        });
    }
}

function generateKey() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
        return v.toString(16);
    });
}