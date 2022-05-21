using Piranha.AttributeBuilder;
using Piranha.Models;

namespace RetroRen.Models
{
    [PostType(Title = "Standard post")]
    public class StandardPost  : Post<StandardPost>
    {
    }
}