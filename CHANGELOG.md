graphiti changelog

# [1.2.0](https://github.com/graphiti-api/graphiti_spec_helpers/compare/v1.1.0...v1.2.0) (2025-03-18)


### Bug Fixes

* allow current_user and params to remain lazy in rspec contexts ([#25](https://github.com/graphiti-api/graphiti_spec_helpers/issues/25)) ([6ce1e07](https://github.com/graphiti-api/graphiti_spec_helpers/commit/6ce1e07bbbcfd8d692d496f2acc6a740ebf9812c))
* jsonapi_included helper may accept symbol keys ([#20](https://github.com/graphiti-api/graphiti_spec_helpers/issues/20)) ([cc3cb2d](https://github.com/graphiti-api/graphiti_spec_helpers/commit/cc3cb2d2dfacad323ae7107b0392c03ebf12e2eb))
* require rspec-core as a dependency of the matchers ([0ea2a92](https://github.com/graphiti-api/graphiti_spec_helpers/commit/0ea2a92d9c8f035c45558f79caaf96737959bfef))


### Features

* alias Node#key? to Node#has_key? ([#24](https://github.com/graphiti-api/graphiti_spec_helpers/issues/24)) ([202aecb](https://github.com/graphiti-api/graphiti_spec_helpers/commit/202aecb6f4637d6f7e3d370e0b5d28a275b7ec1a))
* Allow passing AR records to jsonapi_* http operations ([#22](https://github.com/graphiti-api/graphiti_spec_helpers/issues/22)) ([c5e4b23](https://github.com/graphiti-api/graphiti_spec_helpers/commit/c5e4b235e79a663014e11720c764992d25caceff))
* Support matching against RSpec's`include` builtin ([#23](https://github.com/graphiti-api/graphiti_spec_helpers/issues/23)) ([1ed6fd0](https://github.com/graphiti-api/graphiti_spec_helpers/commit/1ed6fd0a561a43af604821821c569d819e6dff5f))
