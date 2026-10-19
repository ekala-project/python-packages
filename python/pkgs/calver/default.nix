{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "calver";
  version = "2025.10.20";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "di";
    repo = "calver";
    tag = finalAttrs.version;
    hash = "sha256-8CfPQ4uMgKDqMMgutLdsjn/MaAVBJQAp1KqUfxzNMQw=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace "version=calver_version(True)" 'version="${finalAttrs.version}"'
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "calver" ];

  passthru.tests.calver = finalAttrs.finalPackage.overridePythonAttrs { doCheck = true; };

  meta = {
    description = "Setuptools extension for CalVer package versions";
    homepage = "https://github.com/di/calver";
    license = lib.licenses.asl20;
  };
})
