import pytest
from app import create_app


@pytest.fixture
def app():
    """Create and configure a new app instance for each test."""
    app = create_app({"TESTING": True})
    yield app


@pytest.fixture
def client(app):
    """A test client for the app."""
    return app.test_client()


def test_index(client):
    response = client.get("/")
    assert b"System Monitor" in response.data
    assert b"CPU Utilization" in response.data
    assert b"Memory Utilization" in response.data
    assert b'id="cpu-gauge"' in response.data
    assert b'id="mem-gauge"' in response.data
