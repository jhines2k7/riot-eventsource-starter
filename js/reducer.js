export default function reduce(events) {
    "use strict";

    return events.reduce( (state, event) => {
        if(event.topic === 'rocket.update.currentView') {
            state.currentView = event.data.currentView;
        }

        if(event.topic === 'rocket.signin.success' || event.topic === 'rocket.signout.success') {
            state.isLoggedIn = event.data.isLoggedIn;
        }

        if(event.topic === 'rocket.update.category') {
            state.category = event.data.category;
        }

        if(event.topic === 'rocket.update.course') {
            state.course = event.data.course;
        }

        if(event.topic === 'rocket.update.challenge') {
            state.challenge = event.data.challenge;
        }

        if(event.topic === 'rocket.update.categories') {
            state.categories = event.data.categories;
        }

        if(event.topic === 'rocket.update.user') {
            state.user = event.data.user;
        }

        return state;
    }, {
        user: {},
        currentView: 'home',
        isLoggedIn: false,
        category: {},
        course: {},
        challenge: {},
        courses: [],
        categories: []
    });
}
