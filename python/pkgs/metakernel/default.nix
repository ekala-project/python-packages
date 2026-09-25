{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
  ipykernel,
  jedi,
  jupyter-core,
  pexpect,
}:

buildPythonPackage (finalAttrs: {
  pname = "metakernel";
  version = "1.0.7";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-SZoOOZ41Pg+0p04QXqKtKu2JoVBTopn1+pPAJ9chdDo=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    ipykernel
    jedi
    jupyter-core
    pexpect
  ];

  # Tests hang, so disable
  doCheck = false;

  pythonImportsCheck = [ "metakernel" ];

  meta = {
    description = "Jupyter/IPython Kernel Tools";
    homepage = "https://github.com/Calysto/metakernel";
    license = lib.licenses.bsd3;
  };
})
