{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,

  # dependencies
  babel,
  humanize,
  python-dateutil,
  tzlocal,
}:

buildPythonPackage (finalAttrs: {
  pname = "delorean";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "delorean";
    inherit (finalAttrs) version;
    hash = "sha256-Y5E+xCRVWp1H9SGnrz2yShwuOxkGP+JuAZQ/GS6rNek=";
  };

  build-system = [ hatchling ];

  dependencies = [
    babel
    humanize
    python-dateutil
    tzlocal
  ];

  pythonImportsCheck = [ "delorean" ];

  meta = {
    description = "Delorean: Time Travel Made Easy";
    homepage = "https://github.com/myusuf3/delorean";
    license = lib.licenses.mit;
  };
})
