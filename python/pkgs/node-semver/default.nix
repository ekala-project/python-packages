{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "node-semver";
  version = "0.9.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "podhmo";
    repo = "python-node-semver";
    tag = finalAttrs.version;
    hash = "sha256-akeFBF0za4DjcYfR4/M06D5M19o+4xqfyuG74FPSDBU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "nodesemver" ];

  meta = {
    changelog = "https://github.com/podhmo/python-node-semver/blob/${finalAttrs.version}/CHANGES.txt";
    description = "Port of node-semver";
    homepage = "https://github.com/podhmo/python-semver";
    license = lib.licenses.mit;
  };
})
