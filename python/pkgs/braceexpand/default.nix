{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "braceexpand";
  version = "0.1.7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-5uU5vSDq6lNUdHL/lPT7XD07+dCok4jEtWZjq6dl9wU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "braceexpand" ];

  meta = {
    description = "Bash-style brace expansion for Python";
    homepage = "https://github.com/trendels/braceexpand";
    license = lib.licenses.mit;
  };
}
