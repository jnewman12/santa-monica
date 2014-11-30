class TestRecognition < MiniTest::Unit::TestCase
  def test_empty
    assert_route router.add(''),              '/'
  end

  def test_simple
    assert_route router.add('/'),             '/'
    assert_route router.add('/test'),         '/test'
    assert_route router.add('/test/one'),     '/test/one'
    assert_route router.add('/test/one/two'), '/test/one/two'
    assert_route router.add('/test.html'),    '/test.html'
    assert_route router.add('/.html'),        '/.html'
  end

  def test_optional
    route = router {
      add 'one(/two(/three(/four)(/five)))'
    }
    assert_route route, '/one'
    assert_route route, '/one/two'
    assert_route route, '/one/two/three'
    assert_route route, '/one/two/three/four'
    assert_route route, '/one/two/three/five'
  end

  def test_escape_paren
    assert_route router.add('/test\(:variable\)'), '/test(hello)', {:variable => 'hello'}
  end

  def test_escape_colon
    assert_route router.add('/test\:variable'), '/test:variable'
  end

  def test_escape_star
    assert_route router.add('/test\*variable'), '/test*variable'
  end

  def test_partial
    router.add("/test*").to { |env| Rack::Response.new(env['PATH_INFO']).finish }
    assert_body '/optional', router.call(Rack::MockRequest.env_for('/test/optional'))
    assert_body '/',         router.call(Rack::MockRequest.env_for('/test'))
  end
  
  def test_partial_root
    router.add("/*").to { |env| Rack::Response.new(env['PATH_INFO']).finish }
    assert_body '/optional', router.call(Rack::MockRequest.env_for('/optional'))
    assert_body '/',         router.call(Rack::MockRequest.env_for('/'))
  end

  def test_multiple_partial
    test, root = router {
      add("/test").partial.to{|env| [200, {}, ['/test',env['PATH_INFO']]]}
      add("/").partial.to{|env| [200, {}, ['/',env['PATH_INFO']]]}
    }
    assert_body ['/test', '/optional'],     router.call(Rack::MockRequest.env_for('/test/optional'))
    assert_body ['/test', '/optional/'],    router.call(Rack::MockRequest.env_for('/test/optional/'))
    assert_body ['/', '/testing/optional'], router.call(Rack::MockRequest.env_for('/testing/optional'))
  end
end
