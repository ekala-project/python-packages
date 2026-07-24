{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  hatchling,
  hatch-vcs,
  pytest,
  pytest-localserver,
  pytest-metadata,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-base-url";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pytest-dev";
    repo = "pytest-base-url";
    tag = finalAttrs.version;
    hash = "sha256-3P3Uk3QoznAtNODLjXFbeNn3AOfp9owWU2jqkxTEAa4=";
  };

  nativeBuildInputs = [
    hatchling
    hatch-vcs
  ];

  buildInputs = [ pytest ];

  propagatedBuildInputs = [ requests ];
  pythonImportsCheck = [ "pytest_base_url" ];

  meta = {
    description = "Pytest plugin for URL based tests";
    homepage = "https://github.com/pytest-dev/pytest-base-url";
    license = lib.licenses.mpl20;
    maintainers = [ ];
  };
})
