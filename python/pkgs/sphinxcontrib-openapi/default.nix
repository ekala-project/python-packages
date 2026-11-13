{
  lib,
  buildPythonPackage,
  deepmerge,
  fetchPypi,
  # build-system
  setuptools,
  setuptools-scm,
  jsonschema,
  picobox,
  pyyaml,
  sphinx-mdinclude,
  sphinxcontrib-httpdomain,
}:

buildPythonPackage (finalAttrs: {
  pname = "sphinxcontrib-openapi";
  version = "0.10.0";
  pyproject = true;

  src = fetchPypi {
    pname = "sphinxcontrib_openapi";
    inherit (finalAttrs) version;
    hash = "sha256-vuyL9Ozo8o+xs3jmCRS5L+1uOACaYNkV7SzQwCOlT20=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];
  dependencies = [
    deepmerge
    jsonschema
    picobox
    pyyaml
    sphinx-mdinclude
    sphinxcontrib-httpdomain
  ];

  pythonNamespaces = [ "sphinxcontrib" ];

  meta = {
    homepage = "https://github.com/ikalnytskyi/sphinxcontrib-openapi";
    description = "OpenAPI (fka Swagger) spec renderer for Sphinx";
    license = lib.licenses.bsd0;
  };
})
