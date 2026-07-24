{
  lib,
  buildPythonPackage,
  elastic-transport,
  elasticsearch-dsl,
  fetchFromGitHub,
  ply,
  pytest-cov-stub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "luqum";
  version = "1.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jurismarches";
    repo = "luqum";
    tag = version;
    hash = "sha256-X1P7sACcp2yVjW3xWmD88iDT4T9dSDi8yxwDFaRbEsc=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace '--doctest-modules --doctest-glob="test_*.rst"' ""
  '';

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [ ply ];
  pythonImportsCheck = [ "luqum" ];
  meta = {
    description = "Lucene query parser generating ElasticSearch queries";
    homepage = "https://github.com/jurismarches/luqum";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
