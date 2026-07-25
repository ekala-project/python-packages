{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cmake,
  ninja,
  pathspec,
  scikit-build-core,

  # dependencies
  eigen,

  # tests

  nanobind,
}:
buildPythonPackage (finalAttrs: {
  pname = "nanobind";
  version = "2.13.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "wjakob";
    repo = "nanobind";
    tag = "v${finalAttrs.version}";
    fetchSubmodules = true;
    hash = "sha256-YAqjcVBkuNsXvrAaVmDRLQ1F38UBqdnIf8+OseNBzG4=";
  };

  build-system = [
    cmake
    ninja
    pathspec
    scikit-build-core
  ];

  dependencies = [ eigen ];

  dontUseCmakeBuildDir = true;

  # nanobind check requires heavy dependencies such as tensorflow
  # which are less than ideal to be imported in children packages that
  # use it as build-system parameter.
  meta = {
    homepage = "https://github.com/wjakob/nanobind";
    description = "Tiny and efficient C++/Python bindings";
    longDescription = ''
      nanobind is a small binding library that exposes C++ types in Python and
      vice versa. It is reminiscent of Boost.Python and pybind11 and uses
      near-identical syntax. In contrast to these existing tools, nanobind is
      more efficient: bindings compile in a shorter amount of time, produce
      smaller binaries, and have better runtime performance.
    '';
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
