try:
    import torch
    HAVE_TORCH = 1
except:
    HAVE_TORCH = 0


from pudb.var_view import default_stringifier, type_stringifier


def shortened_sfier(value):
    out = default_stringifier(value)

    if len(out) > 15:
        out = type_stringifier(value)

    return out


def pudb_stringifier(value):
    if not HAVE_TORCH:
        return shortened_sfier(value)

    if isinstance(value, torch.nn.Module):
        device = next(value.parameters()).device
        params = sum([p.numel() for p in value.parameters() if p.requires_grad])
        rep = value.__repr__() if len(value.__repr__()) < 55 else type(value).__name__
        return "{}[{}] Params: {}".format(rep, str(device), params)
    elif isinstance(value, torch.Tensor):
        return "%s[%s, %s] %s" % (
            type(value).__name__, str(value.dtype).replace("torch.", ""), str(value.device), str(list(value.shape)))
    else:
        return shortened_sfier(value)


x = torch.randn(10, 5, 4)
m = torch.nn.Linear(5, 2, bias=False)

print(pudb_stringifier(x))
print(pudb_stringifier(m))
