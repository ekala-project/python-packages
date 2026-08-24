{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools-scm,
  # dependencies
  aiohttp,
  # optional dependencies
  aioftp,
  # tests
  tqdm,
}:

buildPythonPackage (finalAttrs: {
  pname = "parfive";
  version = "2.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Cadair";
    repo = "parfive";
    tag = "v${finalAttrs.version}";
    hash = "sha256-i9B860A27KDUJKlE/eQNiGVPEPvnmvmNqMjjdOeBcyY=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    aiohttp
    tqdm
  ];

  optional-dependencies = {
    ftp = [ aioftp ];
  };

  pythonImportsCheck = [ "parfive" ];

  meta = {
    description = "HTTP and FTP parallel file downloader";
    mainProgram = "parfive";
    homepage = "https://parfive.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
