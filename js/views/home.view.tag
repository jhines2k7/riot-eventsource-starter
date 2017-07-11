<home>
    <h1>{ viewModel.greeting }</h1>

    <script>
        import postal from 'postal/lib/postal.lodash'

        this.viewModel = {
            greeting: ''
        };

        subscribe(channel, topic) {
            let subscription = postal.subscribe({
                channel: channel,
                topic: topic,
                callback: function(data, envelope) {
                    this.viewModel.greeting = data.greeting;

                    this.update(this.viewModel);

                }.bind(this)
            });

            return subscription;
        };

        this.subscribe('async', 'myapp.update.greeting');
    </script> 
</home>