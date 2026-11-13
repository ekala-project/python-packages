{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  flit-core,
  blessed,
}:

buildPythonPackage (finalAttrs: {
  pname = "dashing";
  version = "0.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-rrVgIOoq4XCglJj/I/nDDMdsArg940Z+EmIRJXirvZs=";
  };

  build-system = [ flit-core ];

  dependencies = [ blessed ];

  pythonImportsCheck = [ "dashing" ];

  meta = {
    homepage = "https://github.com/FedericoCeratto/dashing";
    description = "Terminal dashboards for Python";
    license = lib.licenses.lgpl3Plus;
  };
})
