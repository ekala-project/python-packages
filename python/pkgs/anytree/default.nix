{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  graphviz,

  # build-system
  pdm-backend,

  # tests
  pytest-cov-stub,
  pyyaml,
  test2ref,
  fontconfig,
}:

buildPythonPackage rec {
  pname = "anytree";
  version = "2.13.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "c0fec0de";
    repo = "anytree";
    tag = version;
    hash = "sha256-kFNYJMWagpqixs84+AaNkh/28asLBJhibTP8LEEe4XY=";
  };

  postPatch = ''
    substituteInPlace src/anytree/exporter/dotexporter.py \
      --replace-fail \
        'cmd = ["dot"' \
        'cmd = ["${lib.getExe' graphviz "dot"}"'
  '';

  build-system = [ pdm-backend ];
  # Tests print “Fontconfig error: Cannot load default config file”
  pythonImportsCheck = [ "anytree" ];

  meta = {
    description = "Powerful and Lightweight Python Tree Data Structure";
    homepage = "https://github.com/c0fec0de/anytree";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
