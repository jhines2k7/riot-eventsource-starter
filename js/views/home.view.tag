<home>
    <div class="hero">
        <h1>Learn. Practice. Win.</h1>
        <h3>Ut at nisi quis ligula aliquet condimentum at nec mi</h3>
        <a href="#/signup">Create FREE Account</a>
        <a href="#/categories">Explore Our Courses</a>
    </div>

    <section>
        <div>
            <h3>Test Prep Categories</h3>
            <p>Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime.</p>
            <ul>
                <li each={ viewModel.categories }>
                    <div>
                        <a href="{ url }">
                            <div>
                                <h3>{ name }</h3>
                                <p>{ summary }</p>
                            </div>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </section>

    <style>
        home section {
            padding: 0 60px;
        }

        home section div {
            max-width: 75em;
            margin: 1.25em auto;
        }

        home section div h3 {
            text-align: center;
        }

        home section div h3+p {
            max-width: 35em;
            text-align: center;
            margin: 10px auto 35px;
        }

        home nav {
            display: flex;
            flex-direction: row;
            height: 50px;
            margin-bottom: 20px;
            border-bottom: 1px solid #e2e8e9;
            align-items: center;
        }

        home nav a {
            margin-right: 20px;
        }

        home .hero {
            width: 100%;
            height: 300px;
            background-color: aqua;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        home section ul {
            display: flex;
            list-style-type: none;
            flex-wrap: wrap;
            margin-left: -10px;
        }

        home section ul li div {
            margin: 0;
        }

        home section ul li {
            flex: 1 0 calc(50%);
            padding-left: 10px;
        }

        home section ul a {
            text-decoration: none;
        }

        home section ul a div {
            padding: 15px;
            margin: 0 0 15px 0;
            background-color: gainsboro;
        }

    </style>

    <script>
        import postal from 'postal/lib/postal.lodash'

        this.viewModel = {
            categories: []
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

        this.subscribe('async', 'rocket.update.categories');
        this.subscribe('routing', 'rocket.update.currentView');
    </script>
</home>