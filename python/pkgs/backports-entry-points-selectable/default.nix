{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "backports-entry-points-selectable";
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "backports.entry_points_selectable";
    inherit version;
    hash = "sha256-F6i0SucA+6VIaG3SdN3JHAYDcVZc1jgGwgodM5EXRuY=";
  };

  build-system = [ setuptools-scm ];

  pythonNamespaces = [ "backports" ];

  pythonImportsCheck = [ "backports.entry_points_selectable" ];

  meta = {
    description = "Compatibility shim providing selectable entry points for older implementations";
    homepage = "https://github.com/jaraco/backports.entry_points_selectable";
    license = lib.licenses.mit;
  };
}
