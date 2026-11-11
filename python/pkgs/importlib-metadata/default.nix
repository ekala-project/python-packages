{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  lazy-importer,
  zipp,
}:

buildPythonPackage (finalAttrs: {
  pname = "importlib-metadata";
  version = "10.2.0";
  pyproject = true;

  src = fetchPypi {
    pname = "importlib_metadata";
    inherit (finalAttrs) version;
    hash = "sha256-lBOiAp/ZylZp0n8Thgcbv+PH68oFRWkuyXUIgkH+HXk=";
  };

  postPatch = ''
    sed -i "/coherent.licensed/d" pyproject.toml
  '';

  build-system = [
    setuptools # otherwise cross build fails
    setuptools-scm
  ];

  dependencies = [
    lazy-importer
    zipp
  ];

  # Cyclic dependencies due to pyflakefs

  pythonImportsCheck = [ "importlib_metadata" ];
  meta = {
    description = "Read metadata from Python packages";
    homepage = "https://importlib-metadata.readthedocs.io/";
    license = lib.licenses.asl20;
  };
})
