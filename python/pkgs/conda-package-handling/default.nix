{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  conda-package-streaming,
}:
buildPythonPackage rec {
  pname = "conda-package-handling";
  version = "2.6.0";
  src = fetchFromGitHub {
    owner = "conda";
    repo = "conda-package-handling";
    tag = version;
    hash = "sha256-VxnmG3ik6GJa/LiHqmyMVF/uBpx8JMCHBs7DVhC4gtU=";
  };

  pyproject = true;
  build-system = [ flit-core ];
  dependencies = [ conda-package-streaming ];

  pythonImportsCheck = [ "conda_package_handling" ];

  meta = {
    description = "Create and extract conda packages of various formats";
    homepage = "https://github.com/conda/conda-package-handling";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
