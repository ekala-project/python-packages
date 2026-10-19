{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  httpretty,
  pyjwt,
  python-dateutil,
  requests,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "adal";
  version = "1.2.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "AzureAD";
    repo = "azure-activedirectory-library-for-python";
    tag = finalAttrs.version;
    hash = "sha256-HE8/P0aohoZNeMdcQVKdz6M31FMrjsd7oVytiaD0idI=";
  };

  postPatch = ''
    sed -i '/cryptography/d' setup.py
  '';

  build-system = [ setuptools ];

  dependencies = [
    pyjwt
    python-dateutil
    requests
  ];
  pythonImportsCheck = [ "adal" ];

  meta = {
    description = "Python module to authenticate to Azure Active Directory (AAD) in order to access AAD protected web resources";
    homepage = "https://github.com/AzureAD/azure-activedirectory-library-for-python";
    license = lib.licenses.mit;
  };
})
