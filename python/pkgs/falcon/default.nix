{ lib
, buildPythonPackage
, isPyPy
, fetchFromGitHub
, # build-system
  cython
, setuptools
,
}:

buildPythonPackage rec {
  pname = "falcon";
  version = "4.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "falconry";
    repo = "falcon";
    tag = version;
    hash = "sha256-f+UoGYyrg8OZow4qONqzXuDVnrZalqUNDyavDoQ7QHE=";
  };

  build-system = [ setuptools ] ++ lib.optionals (!isPyPy) [ cython ];

  pythonImportsCheck = [ "falcon" ];

  meta = {
    description = "Ultra-reliable, fast ASGI+WSGI framework for building data plane APIs at scale";
    homepage = "https://falconframework.org/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
