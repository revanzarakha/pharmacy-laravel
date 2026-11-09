<?php

namespace Tests\Feature;

use Tests\TestCase;

class PharmacySmokeTest extends TestCase
{
    public function test_homepage_is_accessible(): void
    {
        $response = $this->get('/');
        $this->assertContains($response->status(), [200, 302]);
    }
}
