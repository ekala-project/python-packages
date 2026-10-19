{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  gunicorn,
  hatchling,
  httpx,
  trustme,
  uvicorn,
}:

buildPythonPackage (finalAttrs: {
  pname = "uvicorn-worker";
  version = "0.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Kludex";
    repo = "uvicorn-worker";
    tag = finalAttrs.version;
    hash = "sha256-qfk3lkHwuGbRWj4D65EontmEgKtk7ILq6gZCrxcrrJU=";
  };

  build-system = [ hatchling ];

  dependencies = [
    gunicorn
    uvicorn
  ];
  pythonImportsCheck = [ "uvicorn_worker" ];

  meta = {
    description = "Uvicorn worker for Gunicorn";
    homepage = "https://github.com/Kludex/uvicorn-worker";
    license = lib.licenses.bsd3;
  };
})
