{max( 1, 9, 1, 3 )}
{min( 1, 9, -1, 3 )}
{8|max( -1, 2 )}

{let foo=12}
{max( 1, 9, 1, 3, $foo )}
{min( 1, 9, 1, 3, $foo )}
{/let}
