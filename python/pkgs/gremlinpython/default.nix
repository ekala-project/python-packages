{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch,
  aenum,
  aiohttp,
  isodate,
  nest-asyncio,
  setuptools,
}:

buildPythonPackage rec {
  __structuredAttrs = true;

  pname = "gremlinpython";
  version = "3.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "apache";
    repo = "tinkerpop";
    tag = version;
    hash = "sha256-dslSvtne+0mobjhjZDiO7crQE3aW5wEMWw7l3LkBTV8=";
  };

  patches = [
    (fetchpatch {
      name = "remove-async_timeout.pach";
      url = "https://github.com/apache/tinkerpop/commit/aa327ace6feaf6ccd3eca411f3b5f6f86f8571f6.patch";
      excludes = [ "gremlin-python/src/main/python/setup.py" ];
      hash = "sha256-NyXA9vffFem1EzhdNWuoYr7JPkT5DuKyl409LFj9AvQ=";
    })
  ];

  postPatch = ''
    cd gremlin-python/src/main/python

    substituteInPlace gremlin_python/__init__.py \
      --replace-fail ".dev1" ""
  '';

  build-system = [ setuptools ];

  pythonRemoveDeps = [
    "async-timeout"
  ];

  dependencies = [
    aenum
    aiohttp
    isodate
    nest-asyncio
  ];
  # disable custom pytest report generation
  # many tests expect a running tinkerpop server
  meta = {
    description = "Gremlin-Python implements Gremlin, the graph traversal language of Apache TinkerPop, within the Python language";
    homepage = "https://tinkerpop.apache.org/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
