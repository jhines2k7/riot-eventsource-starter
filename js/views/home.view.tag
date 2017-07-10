<home>
    <h1>Hello World!</h1>

    <script>
        import postal from 'postal/lib/postal.lodash'

        this.viewModel = {
            categories: ''
        };

        subscribe(channel, topic) {
            let subscription = postal.subscribe({
                channel: channel,
                topic: topic,
                callback: function(data, envelope) {
                    if(data.currentView !== 'home') {
                        this.unmount();
                    } else {
                        this.viewModel.categories = data.categories;

                        this.update(this.viewModel);
                    }

                }.bind(this)
            });

            return subscription;
        };

        this.subscribe('async', 'rocket.update.greeting');
        this.subscribe('routing', 'rocket.update.currentView');
    </script> 
</home>