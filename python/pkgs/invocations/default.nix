{
  lib,
  buildPythonPackage,
  build,
  blessed,
  fetchFromGitHub,
  invoke,
  releases,
  semantic-version,
  tabulate,
  tqdm,
  twine,
  setuptools,
}:

buildPythonPackage rec {
  pname = "invocations";
  version = "4.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyinvoke";
    repo = "invocations";
    tag = version;
    hash = "sha256-G6EKypqP2/coPChLwwEKZ2WIEay0qfyM8M5jKb0oS2c=";
  };

  patches = [ ./replace-blessings-with-blessed.patch ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "semantic_version>=2.4,<2.7" "semantic_version"
  '';

  build-system = [ setuptools ];

  dependencies = [
    build
    blessed
    invoke
    releases
    semantic-version
    tabulate
    tqdm
    twine
  ];

  pythonImportsCheck = [ "invocations" ];

  meta = {
    description = "Common/best-practice Invoke tasks and collections";
    homepage = "https://invocations.readthedocs.io/";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
