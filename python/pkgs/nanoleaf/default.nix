{
  lib,
  buildPythonPackage,
  fetchPypi,
  requests,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "nanoleaf";
  version = "0.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-GmnwW/IleBlvsGj1YwSPZrOho9uVlWeNzpZX6VbstZ0=";
  };

  prePatch = ''
    sed -i '/^gitVersion =/d' setup.py
    substituteInPlace setup.py \
      --replace-fail 'gitVersion' '"${finalAttrs.version}"'
  '';

  build-system = [ setuptools ];

  dependencies = [ requests ];

  # Module has no test

  pythonImportsCheck = [ "nanoleaf" ];

  meta = {
    description = "Module for interacting with Nanoleaf Aurora lighting";
    homepage = "https://github.com/software-2/nanoleaf";
    license = lib.licenses.mit;
  };
})
