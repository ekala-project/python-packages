{
  lib,
  boto3,
  buildPythonPackage,
  envs,
  fetchFromGitHub,
  freezegun,
  mock,
  moto,
  pyjwt,
  requests,
  requests-mock,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pycognito";
  version = "2024.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pvizeli";
    repo = "pycognito";
    tag = version;
    hash = "sha256-U23fFLru4j6GnWMcYtsCW9BVJkVcCoefPH6oMijYGew=";
  };

  build-system = [ setuptools ];

  dependencies = [
    boto3
    envs
    pyjwt
    requests
  ]
  ++ pyjwt.optional-dependencies.crypto;
  pythonImportsCheck = [ "pycognito" ];

  meta = {
    description = "Python class to integrate Boto3's Cognito client so it is easy to login users. With SRP support";
    homepage = "https://github.com/pvizeli/pycognito";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
