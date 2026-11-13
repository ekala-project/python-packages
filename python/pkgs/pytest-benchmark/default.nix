{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pytest,
  py-cpuinfo,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-benchmark";
  version = "5.3.1";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_benchmark";
    inherit (finalAttrs) version;
    hash = "sha256-we5wpY+b+xrJVcxjQkejQLDfe8uUkHHPyjlvFsb8NRY=";
  };

  # 5.3.0 switched to the py-cpuinfo2 fork, which provides the same `cpuinfo`
  # module; only `cpuinfo.get_cpu_info()` is used, so py-cpuinfo works fine.
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"py-cpuinfo2>=10.1"' '"py-cpuinfo"'
  '';

  build-system = [ setuptools ];

  buildInputs = [ pytest ];

  dependencies = [ py-cpuinfo ];

  pythonImportsCheck = [ "pytest_benchmark" ];

  meta = {
    description = "Pytest fixture for benchmarking code";
    homepage = "https://github.com/ionelmc/pytest-benchmark";
    license = lib.licenses.bsd2;
  };
})
