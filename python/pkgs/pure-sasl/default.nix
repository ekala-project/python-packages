{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pure-sasl";
  version = "0.6.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "thobbs";
    repo = "pure-sasl";
    tag = version;
    hash = "sha256-AHoZ3QZLr0JLE8+a2zkB06v2wRknxhgm/tcEPXaJX/U=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [
    "puresasl"
    "puresasl.client"
    "puresasl.mechanisms"
  ];

  meta = {
    description = "Reasonably high-level SASL client written in pure Python";
    homepage = "http://github.com/thobbs/pure-sasl";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
