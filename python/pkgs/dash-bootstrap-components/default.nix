{
  lib,
  buildPythonPackage,
  fetchPypi,
  dash,
  hatchling,
}:

buildPythonPackage rec {
  pname = "dash-bootstrap-components";
  version = "2.0.5a2";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "dash_bootstrap_components";
    hash = "sha256-quEneBgSbhIgTvwGkHaGB1X7rhj/Uwz/UN6CWAkrMSM=";
  };

  build-system = [ hatchling ];

  dependencies = [ dash ];

  # Tests a additional requirements
  doCheck = false;

  pythonImportsCheck = [ "dash_bootstrap_components" ];

  meta = {
    description = "Bootstrap components for Plotly Dash";
    homepage = "https://github.com/facultyai/dash-bootstrap-components";
    license = lib.licenses.asl20;
  };
}
