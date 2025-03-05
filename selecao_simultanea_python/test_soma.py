from main import soma

def test_soma_numeros():
    assert soma(2, 2) == 4
    assert soma(3, 3) == 6
    assert soma(10, 10) == 20
    assert soma(1, 1) == 2