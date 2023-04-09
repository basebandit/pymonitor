import psutil
from flask import Flask, render_template


def create_app(test_config=None):
    """Create and configure an instance of the Flask application."""
    app = Flask(__name__, instance_relative_config=True)
    if test_config:
        app.config.update(test_config)

    @app.route("/")
    def index():
        cpu_metric = psutil.cpu_percent()
        mem_metric = psutil.virtual_memory().percent

        message = ""
        if cpu_metric > 80 or mem_metric > 80:
            message = "High CPU or Memory utilization detected. Please scale up."
        return render_template(
            "index.html", cpu_metric=cpu_metric, mem_metric=mem_metric, message=message
        )

    return app
