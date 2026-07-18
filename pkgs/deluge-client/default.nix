{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "deluge-client";
  version = "1.10.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-OIGu48Tgyp3YpWtxAEe4N+HQh6g+QhY2oHR3H5Kp8bU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "deluge_client" ];

  meta = {
    description = "Lightweight pure-python rpc client for deluge";
    homepage = "https://github.com/JohnDoee/deluge-client";
    license = lib.licenses.mit;
  };
}
