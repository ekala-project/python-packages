{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  cheroot,
  more-itertools,
  multipart,
}:

buildPythonPackage (finalAttrs: {
  pname = "web.py";
  version = "0.76";
  pyproject = true;

  src = fetchPypi {
    pname = "web_py";
    inherit (finalAttrs) version;
    hash = "sha256-8Jc97iBKf7zo2l5nLRfmsJ4kStStXDPJy2ykI9BAAZg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cheroot
    more-itertools
    multipart
  ];

  pythonImportsCheck = [ "web" ];

  meta = {
    description = "Makes web apps";
    homepage = "https://webpy.org/";
    license = lib.licenses.publicDomain;
  };
})
