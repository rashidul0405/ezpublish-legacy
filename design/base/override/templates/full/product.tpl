{* Product - Full view *}

<div class="content-view-full">
    <div class="class-product">

        <h1>{$node.name|wash()}</h1>

    {section show=$node.object.data_map.image.content}
        <div class="attribute-image">
            {attribute_view_gui alignment=right image_class=medium attribute=$node.object.data_map.image.content.data_map.image}
        </div>
    {/section}

        <div class="attribute-short">
           {attribute_view_gui attribute=$node.object.data_map.short_description}
        </div>

        <div class="attribute-long">
           {attribute_view_gui attribute=$node.object.data_map.description}
        </div>

        <div class="attribute-price">
          <p>
           {attribute_view_gui attribute=$node.object.data_map.price}
          </p>
        </div>

        <div class="content-action">
        <form method="post" action={"content/action"|ezurl}>
            <input type="submit" class="defaultbutton" name="ActionAddToBasket" value="{"Add to basket"|i18n("design/base")}" />
            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
            <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
            <input type="hidden" name="ViewMode" value="full" />
        </form>
        </div>

        <div class="attribute-pdf">
          <p>
             <a href={concat('/content/pdf/',$node.node_id)|ezurl}>{"Download PDF"|i18n("design/base")}</a>
          </p>
        </div>

        <h2>{"Product reviews"|i18n("design/base")}</h2>
        <div class="content-view-children">
            {section var=review loop=fetch_alias( reviews, hash( parent_node_id, $node.node_id ) )}
                {node_view_gui view='line' content_node=$review}
            {/section}
        </div>

        {* Are we allowed to create new object under this node? *}
        {section show=$node.object.can_create}
        <div class="content-action">
            <form method="post" action={"content/action"|ezurl}>
                <input type="hidden" name="ClassIdentifier" value="review" />
                <input type="hidden" name="NodeID" value="{$node.node_id}" />
                <input class="button" type="submit" name="NewButton" value="New review" />
            </form>
        </div>
        {section-else}
            <div class="message-warning">
               <h3>{"You are not allowed to create comments."|i18n("design/base")}</h3>
            </div>
        {/section}

        {let related_purchase=fetch( shop, related_purchase, hash( contentobject_id, $node.contentobject_id,
                                                               limit, 10 ) )}
        {section show=$related_purchase}
            <h2>{"People who bought this also bought"|i18n("design/base")}</h2>

            <div class="relatedorders">
            {section var=product loop=$related_purchase}
                {content_view_gui view=text_linked content_object=$product.item}
            {/section}
            </div>
       {/section}
       {/let}
</div>

   </div>
</div>
